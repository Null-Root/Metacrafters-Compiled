import {useState, useEffect} from "react";
import {ethers} from "ethers";
import storage_abi from "../artifacts/contracts/Assessment.sol/Assessment.json";

export default function HomePage() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [storage, setStorage] = useState(undefined);

	const [storeValue, setStoreValue] = useState(undefined);
  const [fetchedValue, setFetchedValue] = useState(undefined);
	const [storeHistory, setStoreHistory] = useState([]);

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
  const storageABI = storage_abi.abi;

  const getWallet = async() => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const account = await ethWallet.request({method: "eth_accounts"});
      handleAccount(account);
    }
  }

  const handleAccount = (account) => {
    if (account) {
      console.log ("Account connected: ", account);
      setAccount(account);
    }
    else {
      console.log("No account found");
    }
  }

  const connectAccount = async() => {
    if (!ethWallet) {
      alert('MetaMask wallet is required to connect');
      return;
    }
  
    const accounts = await ethWallet.request({ method: 'eth_requestAccounts' });
    handleAccount(accounts);
    
    // once wallet is set we can get a reference to our deployed contract
    getStorageContract();
  };

  const getStorageContract = () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const storageContract = new ethers.Contract(contractAddress, storageABI, signer);
 
    setStorage(storageContract);
  }

	////////////////////////////////////////////////////////////////////////////

	const setStoredValueFn = async () => {
    if (storage) {
      let tx = await storage.setStoredValue(storeValue);
      await tx.wait()
    }
	}

	const getStoredValueFn = async () => {
		if (storage) {
      setFetchedValue((await storage.getStoredValue()).toNumber());
    }
	}

	const getStoreHistoryFn = async () => {
    if (storage) {
      const storeHistoryBN = await storage.getStoreHistory();
      const storeHistoryArray = storeHistoryBN.map(value => value.toNumber());
      setStoreHistory(storeHistoryArray);
    }
  }

	////////////////////////////////////////////////////////////////////////////

  const initUser = () => {
    // Check to see if user has Metamask
    if (!ethWallet) {
      return <p>Please install Metamask in order to use this EBS.</p>
    }

    // Check to see if user is connected. If not, connect to their account
    if (!account) {
      return <button onClick={connectAccount}>Please connect your Metamask wallet</button>
    }

    return (
			<>
				<p>
					<span>Set a value on this basic storage: </span>
					<input
							type="number"
							placeholder="Enter value to store"
							value={storeValue}
							onChange={(e) => setStoreValue(e.target.value)}
						/>
					<button onClick={setStoredValueFn}>Store Value</button>
				</p>
				<p>
					<span>Get the currently stored value on this basic storage: </span>
					<button onClick={getStoredValueFn}>Get Stored Value</button>
					<p>Currently Stored Value: {fetchedValue}</p>
				</p>
				<p>
					<span>Get the history of values stored on this basic storage: </span>
					<button onClick={getStoreHistoryFn}>Get History of Stored Values</button>
          <p>Store History: {storeHistory.join(", ")}</p>
				</p>
			</>
    )
  }

  useEffect(() => {getWallet();}, []);

  return (
    <main className="container">
      <header><h1>This is my Simple Basic Storage (SBS)!</h1></header>
      { initUser() }

      <style jsx>{`
        .container {
          text-align: center
        }
      `}
      </style>
    </main>
  )
}
