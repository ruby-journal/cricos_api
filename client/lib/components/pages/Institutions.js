import React, { PropTypes } from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'
import { Link } from 'react-router'

import * as applicationActions from '../../actions/application'

@connect(state => ({
  application: state.application
}), dispatch => ({
  actions: bindActionCreators(applicationActions, dispatch)
}))
export default class Institutions extends React.Component {
  static propTypes = {
    actions: PropTypes.object.isRequired
  }

  constructor (props) {
    super(props)
  }

  componentDidMount () {
    this.props.actions.fetchData()
  }

  render () {
    let { institutions } = this.props.application
    return (
      <div>
        <div className="header">
          <h1>Institution</h1>
        </div>
        <div className="content">
          <ul>
            { institutions &&
              institutions.map((institution) => {
                return (
                  <li key={institution.id}>
                    <Link to={`/institution/${institution.id}`}>
                      {institution.attributes.name}
                    </Link>
                  </li>
                )
              })
            }
          </ul>
        </div>
      </div>
    )
  }
}
