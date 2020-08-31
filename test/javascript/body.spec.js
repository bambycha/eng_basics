import React from 'react'
import { shallow } from 'enzyme'
import Body from 'packs/body'
import nock from 'nock';

describe('Body component', () => {
  const data = [{
    "id":1,
    "created_at":"2018-06-24T21:32:11.472Z",
    "sequence_length":2,
    "squares_sum":1,
    "updated_at":"2018-06-24T21:32:11.472Z",
    "sequence":[0,1],
    "url":"http://localhost:3000/fibs/1.json"
  }, {
    "id":3,
    "created_at":"2018-06-24T21:32:29.203Z",
    "sequence_length":12,
    "squares_sum":12816,
    "updated_at":"2018-06-24T21:34:43.684Z",
    "sequence":[0,1,1,2,3,5,8,13,21,34,55,89],
    "url":"http://localhost:3000/fibs/3.json"
  }]

  let wrapper;


  beforeEach(() => {
    nock('http://localhost:3000')
      .get('/fibs.json')
      .reply(200, () => data)
    wrapper = shallow(<Body />);
    wrapper.setState({fibs: data});
  });

  afterEach(() => {
    wrapper.setState({fibs: []});
  });

  it('renders', () => {
    expect(wrapper.exists()).toBeTruthy();
  })

  it('renders content of compoent correctly', () => {
     const allFibsComponent = wrapper.find('AllFibs');
     expect(allFibsComponent.length).toBe(1);
     expect(wrapper.find('NewFib').length).toBe(1);
     expect(allFibsComponent.dive().find('Fib').length).toBe(2);
  })

  it('adds new fib', () => {
    wrapper.instance().addNewFib({id: 4});
    expect(wrapper.state().fibs.length).toBe(3);
  });

  it('deletes fib', () => {
    wrapper.instance().deleteFib(3);
    expect(wrapper.state().fibs.length).toBe(1);
  });

  it('updates fibs', () => {
    wrapper.instance().updateFib({id: 3, sequence_length: 10});
    const fib = wrapper.state().fibs.find((f) => f.id === 3);
    expect(fib.sequence_length).toBe(10);
  });
})

