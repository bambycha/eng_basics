import 'isomorphic-fetch'
import nock from 'nock';
import Enzyme from 'enzyme'
import EnzymeAdapter from 'enzyme-adapter-react-16'

Enzyme.configure({ adapter: new EnzymeAdapter() })
nock.disableNetConnect();
