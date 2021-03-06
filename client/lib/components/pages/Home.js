import React, { PropTypes } from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { Link } from 'react-router'

import * as applicationActions from '../../actions/application'
import SearchBox from './SearchBox'
import SearchResult from './SearchResult'

@connect(state => ({
  application: state.application
}), dispatch => ({
  actions: bindActionCreators(applicationActions, dispatch)
}))
export default class Home extends React.Component {
  static propTypes = {
    actions: PropTypes.object
  }

  render () {
    return (
      <div>
        <div className="header">
          CRICOS
          <div>
            <Link to='/institutions'>Institutions</Link>
            <Link to='/courses'>Courses</Link>
          </div>
        </div>
        <div className="content">
          <SearchBox {...this.props} />
          <SearchResult {...this.props} />
        </div>
      </div>
    )
  }
}
