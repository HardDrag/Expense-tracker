import './App.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faCoffee } from '@fortawesome/free-solid-svg-icons'

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p>
          Expense tracker
          <FontAwesomeIcon icon={faCoffee} />
        </p>
      </header>
    </div>
  );
}

export default App;
