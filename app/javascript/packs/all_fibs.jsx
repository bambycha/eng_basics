import React from 'react'
import Fib from './fib';

const AllFibs = (props) => {
  const fibs = props.fibs.map((fib) => {
    return(
      <Fib
        fib={fib}
        handleDelete={props.handleDelete}
        handleUpdate={props.handleUpdate}
        key={fib.id}
      />
    )
  })

  return(
    <table>
      <thead>
        <tr>
          <th>Sequence length</th>
          <th>Sum of squares</th>
          <th>Generated sequence</th>
          <th colSpan="2"></th>
        </tr>
      </thead>
      <tbody>
        {fibs}
      </tbody>
    </table>
  )
}

export default AllFibs;