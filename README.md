# 工研院計劃伺服器部分安裝説明
## 使用以太坊私有鏈版本
*  Geth/v1.8.20-stable
*  go1.10.1
*  web3@0.20.6
*  使用環境Ubuntu/mac


## 安裝go
```shell=
wget https://dl.google.com/go/go1.10.1.linux-armv6l.tar.gz

sudo tar -C /usr/local -xzf go1.10.1.linux-armv6l.tar.gz

export PATH=$PATH:/usr/local/go/bin
```

## 安裝geth(Linux or MAC)

```shell=
mkdir src

cd src

sudo apt-get install -y git build-essential libgmp3-dev golang

git clone -b release/1.8 https://github.com/ethereum/go-ethereum.git

cd go-ethereum

make

sudo cp build/bin/geth /usr/local/bin/

```


## 安裝以太坊私有鏈環境
* 先確認安裝好go與go-ethereum
* 建立一個empty資料夾
```shell=
$ mkdir chain
$ cd chain
```
* 在資料夾中建立genesis.json
```
$ vim genesis.json

//輸入創世區塊内文
{
  "config": {
    "chainId": 33,
    "homesteadBlock": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "ByzantiumBlock": 0 
  },
  "nonce": "0x0000000000000033",
  "timestamp": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "gasLimit": "0x8000000",
  "difficulty": "0x1",
  "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x3333333333333333333333333333333333333333",
  "alloc": {}
}

```

* 在終端機中安裝私有鏈資料
```shell=
geth --datadir ./data/ init genesis.json
```

* 在終端機中geth資料夾下，啓動私有鏈with web socket

```shell=
geth --datadir data --networkid 33 --ws --wsaddr "0.0.0.0" --wsapi "eth,web3,personal,debug,db,admin,miner,net,shh,txpool" --wsport 8546 --wsorigins "*" --rpc --rpcport 8545 --rpccorsdomain "*" --rpcapi " eth,web3,personal,debug,db,admin,miner,net,shh,txpool " --nodiscover console
```



## 主合約部署步驟(伺服器部分)
1. 啓動終端機，到`BP-web/migrate`的資料夾下，啓動私有鏈（預設8545 port）
```shell=
git clone https://github.com/nowvan/BP-web
cd BP-web/migrate
geth attach http://localhost:8545
```

2. 解鎖第0個賬戶`eth.account[0]`並start mining
```shell=
//賬戶解鎖
personal.unlockAccount()

//開始挖礦
miner.start()
```
4. 部署合約
```shell=
loadScript("deploy_test.js")
```

5. 將終端機中印出來的合約地址，更改到`MC_address`檔案中
![](https://i.imgur.com/TbZkMZV.png)

6. 退出到`ITRI_Cloud`資料夾中

7. 修改`views/index.ejs、views/manager.ejs、registerid.ejs、searchbyidtime.ejs`中dataAPI路徑
````javascript=
    //index.ejs at 160 line
    let dataAPI = 'http://${IP}';
    //registerid.ejs at 112 line
    var dataAPI = 'http://${IP}';
    //searchbyidtime.ejs at 146 line
    let dataAPI = 'http://${IP}';
    //manager.ejs at 98 line
    let dataAPI = 'http://${IP}';
    
````
8.新增修訂.env檔
* HOST為本地位置
* DATABASE_USER為資料庫ID
* DATABASE_PASSWORD為資料庫密碼
* DATABASE 為資料庫名稱
````javascript=
HOST = '127.0.0.1'
DATABASE_USER = '${Data base ID}'
DATABASE_PASSWORD = '${Data base password}'
DATABASE = 'ITRIProject'
````
```shell=
npm install
npm start
```

## note
* 在此系統中，所有交易都使用`account[0]`送出
* 資料庫Schema 在 DataBase Schema 資料夾中

###### tags: `blockchain`
