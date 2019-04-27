import React from 'react'
import { shallow } from 'enzyme'
import Hello from 'packs/hello'

describe('Hello component', () => {
  const component = shallow(<Hello />);

  describe('when a name is given as a prop', () => {
    it('render Hello Caique!', () => {
      const component = shallow(<Hello name="Caique" />);
      expect(component.text()).toBe('Hello Caique!')
    })
  })

  describe('when no name is given', () => {
    it('render Hello David!', () => {
      expect(component.text()).toBe('Hello David!')
    })
  })
})

