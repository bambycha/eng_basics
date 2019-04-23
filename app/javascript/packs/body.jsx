import React from 'react';
import NewFib from './new_fib';
import AllFibs from './all_fibs';

export default class Body extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      fibs: []
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.addNewFib = this.addNewFib.bind(this);
    this.handleDelete = this.handleDelete.bind(this);
    this.deleteFib = this.deleteFib.bind(this);
    this.handleUpdate = this.handleUpdate.bind(this);
    this.updateFib = this.updateFib.bind(this)
  }

  handleFormSubmit(sequenceLength){
    let body = JSON.stringify({fib: {sequence_length: sequenceLength} })

    fetch('/fibs.json', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: body,
    })
      .then((response) => { return response.json() })
      .then((fib) => { this.addNewFib(fib) })
  }

  handleDelete(id){
    fetch(`/fibs/${id}.json`,
    {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => {
      this.deleteFib(id)
    })
  }

  handleUpdate(fib){
    fetch(`/fibs/${fib.id}.json`,
    {
      method: 'PUT',
      body: JSON.stringify({fib: fib}),
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then((response) => { return response.json() })
      .then((fib) => { this.updateFib(fib) })
  }

  updateFib(fib){
    const index = this.state.fibs.findIndex((f) => f.id === fib.id)
    this.setState({
      fibs: [...this.state.fibs.slice(0, index), fib, ...this.state.fibs.slice(index + 1)]
    })
  }

  deleteFib(id){
    newFibs = this.state.fibs.filter((fib) => fib.id !== id)
    this.setState({
      fibs: newFibs
    })
  }

  componentDidMount(){
    fetch('/fibs.json')
      .then((response) => { return response.json() })
      .then((data) => { this.setState({ fibs: data }) });
  }

  addNewFib(fib){
    this.setState({
      fibs: [fib, ...this.state.fibs]
    })
  }

  render(){
    return(
      <div>
        <NewFib handleFormSubmit={this.handleFormSubmit} />
        <br />
        <AllFibs
          fibs={this.state.fibs}
          handleDelete={this.handleDelete}
          handleUpdate = {this.handleUpdate}
        />
      </div>
    )
  }
}
