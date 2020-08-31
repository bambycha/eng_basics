// Vendor
import React from 'react';
import { shallow } from 'enzyme';
import td from 'testdouble';

// Internal
import Fib from 'packs/fib'

describe('Fib', () => {
  let props;
  let wrapper;
  let data;
  let fib;

  beforeEach(() => {
    fib = {
      id: 1,
      sequence_length: 2,
      squares_sum: 1,
      sequence: [0, 1],
      url: "http://localhost:3000/fibs/1.json"
    }
    props = {
      fib,
      handleDelete: jest.fn(),
      handleUpdate: jest.fn(),
    };

    wrapper = shallow(<Fib {...props} />);
  });

  it('renders', () => {
    expect(wrapper.exists()).toBeTruthy();
    expect(wrapper.state('editable')).toBeFalsy();
  });

  it('calls handleDelete when delete button is clicked', () => {
    const deleteButton = wrapper.find('.delete');
    deleteButton.simulate('click');
    expect(props.handleDelete).toBeCalledWith(props.fib.id);
  });

  it('changes editable in the state when edit button is clicked', () => {
    const deleteButton = wrapper.find('.edit');
    deleteButton.simulate('click');
    expect(wrapper.state('editable')).toBeTruthy();
  });

  // it('renders <Fib/>', () => {
  //   expect(wrapper.find('Fib').length).toBe(2);
  // });

  // it('renders table', () => {
  //   expect(wrapper.find('table').length).toBe(1);
  //   expect(wrapper.find('th').length).toBe(4);
  // });
});
