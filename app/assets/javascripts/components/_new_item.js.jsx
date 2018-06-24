const NewFib = (props) => {
  let formFields = {}

  return(
    <div>
      <input ref={input => formFields.sequenceLength = input} placeholder='Enter the sequence length'/>
      <button onClick={ () =>
        props.handleFormSubmit(formFields.sequenceLength.value)}>Submit</button>
    </div>
  )
}
