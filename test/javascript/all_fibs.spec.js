// Vendor
import React from 'react';
import { shallow } from 'enzyme';

// Internal
import AllFibs from 'packs/all_fibs'

describe('AllFibs', () => {
  let props;
  let wrapper;
  let data;

  beforeEach(() => {
    data = [{id: 1}, {id: 3}];
    props = { fibs: data };
    wrapper = shallow(<AllFibs {...props} />);
  });

  it('renders', () => {
    expect(wrapper.exists()).toBeTruthy();
  });

  it('renders <Fib/>', () => {
    expect(wrapper.find('Fib').length).toBe(2);
  });

  it('renders table', () => {
    expect(wrapper.find('table').length).toBe(1);
    expect(wrapper.find('th').length).toBe(4);
  });
});
