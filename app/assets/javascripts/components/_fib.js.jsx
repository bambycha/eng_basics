class Fib extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      editable: false
    }
    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit() {
    if (this.state.editable) {
      let sequenceLength = this.sequenceLength.value;
      let id = this.props.fib.id
      let fib = {id, sequence_length: sequenceLength};
      this.props.handleUpdate(fib)
    }

    this.setState({
      editable: !this.state.editable
    })
  }

  render() {
    const {
      id,
      sequence_length: sequenceLength,
      sequence,
      squares_sum: squaresSum
    } = this.props.fib;

    const sequenceLengthContent = this.state.editable
      ? <input type='number' ref={input => this.sequenceLength = input} defaultValue={sequenceLength}/>
      : sequenceLength

    return(
      <tr>
        <td>{sequenceLengthContent}</td>
        <td>{squaresSum}</td>
        <td>{`[${sequence.join()}]`}</td>
        <td>
          <button onClick={() => this.props.handleDelete(id)}>Delete</button>
        </td>
        <td>
          <button onClick={this.handleEdit}>{this.state.editable? 'Submit' : 'Edit'}</button>
        </td>
      </tr>
    )
  }
}