package com.shopping.core.tools;

import org.springframework.stereotype.Component;
import org.web3j.abi.FunctionEncoder;
import org.web3j.abi.FunctionReturnDecoder;
import org.web3j.abi.TypeReference;
import org.web3j.abi.datatypes.Address;
import org.web3j.abi.datatypes.Bool;
import org.web3j.abi.datatypes.Function;
import org.web3j.abi.datatypes.Type;
import org.web3j.abi.datatypes.generated.Uint256;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.WalletUtils;
import org.web3j.protocol.Web3j;
import org.web3j.protocol.admin.Admin;
import org.web3j.protocol.admin.methods.response.NewAccountIdentifier;
import org.web3j.protocol.admin.methods.response.PersonalUnlockAccount;
import org.web3j.protocol.core.DefaultBlockParameterName;
import org.web3j.protocol.core.methods.request.Transaction;
import org.web3j.protocol.core.methods.response.*;
import org.web3j.protocol.http.HttpService;
import org.web3j.utils.Convert;

import java.io.File;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CompletableFuture;

/**
 */
@Component
public class Wallet {
    public static String blockchainAccountPath = "//geth-alltools-linux-amd64-1.8.2-b8b9f7f4/chain/testchain/keystore/";
    public static String blockchainMainAccountPass = "";
    public static String blockchainMainAccountFile = ".json";
    public static String blockchainWalletService = "";
    public static String blockchainContractAddress = "";
    public static String blockchainMainAccountAddress = "";
    public static String blockchainGasPrice = "20000000000";
    public static String blockchainGasLimit = "4300000";

    /**
     * 创建账户
     *
     * @param userPassword 用户密码
     * @return
     * @throws Exception
     */
    public static String createAccounts(String userPassword) throws Exception {
        return WalletUtils.generateNewWalletFile(userPassword, new File(blockchainAccountPath), true);
    }

    /**
     * 远程创建账户
     *
     * @param ipAndPort    地址和端口(http://127.0.0.1:8545)
     * @param userPassword 用户密码
     * @return
     * @throws Exception
     */
    public static String createAccounts(String ipAndPort, String userPassword) throws Exception {
        Admin admin = Admin.build(new HttpService(ipAndPort));
        NewAccountIdentifier newAccountIdentifier = admin.personalNewAccount(userPassword).send();
        return newAccountIdentifier.getAccountId();
    }


    /**
     * 代币转账
     */
    public static String sendTokenTransaction(Web3j web3j, Admin admin, String fromAddress, String password, String toAddress, String contractAddress,BigInteger amount) {
        String txHash = null;
        try {
            PersonalUnlockAccount personalUnlockAccount = admin.personalUnlockAccount(
                    fromAddress, password, BigInteger.valueOf(10)).send();
            if (personalUnlockAccount.accountUnlocked()) {
                String methodName = "transfer";
                List<Type> inputParameters = new ArrayList<>();
                List<TypeReference<?>> outputParameters = new ArrayList<>();

                Address tAddress = new Address(toAddress);

                Uint256 value = new Uint256(amount);
                inputParameters.add(tAddress);
                inputParameters.add(value);

                TypeReference<Bool> typeReference = new TypeReference<Bool>() {
                };
                outputParameters.add(typeReference);

                Function function = new Function(methodName, inputParameters, outputParameters);

                String data = FunctionEncoder.encode(function);

                EthGetTransactionCount ethGetTransactionCount = web3j
                        .ethGetTransactionCount(fromAddress, DefaultBlockParameterName.LATEST).sendAsync().get();
                BigInteger nonce = ethGetTransactionCount.getTransactionCount();
                BigInteger gasPrice = Convert.toWei(BigDecimal.valueOf(5), Convert.Unit.GWEI).toBigInteger();

                Transaction transaction = Transaction.createFunctionCallTransaction(fromAddress, nonce, gasPrice,
                        BigInteger.valueOf(60000), contractAddress, data);

                EthSendTransaction ethSendTransaction = web3j.ethSendTransaction(transaction).sendAsync().get();
                txHash = ethSendTransaction.getTransactionHash();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return txHash;
    }

    /**
     * 奖励支付状态
     *
     * @param transactionHash 交易哈希值
     * @return
     * @throws Exception
     */
    public static Boolean getRewardPayStart(String transactionHash) throws Exception {
        // 连接钱包
        Web3j web3j = Web3j.build(new HttpService(blockchainWalletService));
        EthTransaction ethTransaction = web3j.ethGetTransactionByHash(transactionHash).send();
        if (ethTransaction.getTransaction().isPresent()) {
            BigInteger blockNumber = ethTransaction.getResult().getBlockNumber();
            if (null == blockNumber) {
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    /**
     * 查询代币余额
     *
     * @param userAddress 用户地址
     * @return
     * @throws Exception
     */
    public static BigInteger getTokenBalance(String userAddress) throws Exception {
        // 连接钱包
        Web3j web3j = Web3j.build(new HttpService(blockchainWalletService));
        // 输入参数
        List<Type> inputParameters = new ArrayList<>();
        Address address = new Address(userAddress);
        inputParameters.add(address);
        // 输出参数
        List<TypeReference<?>> outputParameters = new ArrayList<>();
        TypeReference<Uint256> typeReference = new TypeReference<Uint256>() {
        };
        outputParameters.add(typeReference);
        // 加载合约
        Function function = new Function("balanceOf", inputParameters, outputParameters);
        String encodedFunction = FunctionEncoder.encode(function);
        String contractAddress = blockchainContractAddress;
        Transaction transaction = Transaction.createEthCallTransaction(userAddress, contractAddress, encodedFunction);
        // 查询余额
        EthCall ethCall = web3j.ethCall(transaction, DefaultBlockParameterName.LATEST).send();
        List<Type> results = FunctionReturnDecoder.decode(ethCall.getValue(), function.getOutputParameters());
        return (BigInteger) results.get(0).getValue();
    }
}
