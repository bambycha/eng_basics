import React from 'react'
import { shallow } from 'enzyme'
import Main from 'packs/main'

describe('Main component', () => {
  const wrapper = shallow(<Main />);

  it('renders Body component', () => {
    expect(wrapper.find('Body').length).toBe(1);
  })
})

