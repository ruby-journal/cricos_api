import React, { Component } from 'react'
import { connect } from 'react-redux'
import { bindActionCreators } from 'redux'

import * as applicationActions from '../../actions/application'

@connect(state => ({
  application: state.application
}), dispatch => ({
  actions: bindActionCreators(applicationActions, dispatch)
}))
export default class Institution extends Component {

  componentDidMount () {
    // fetch data if data is not available
    if (!this.props.application || !this.props.application.institutions) {
      this.props.actions.fetchData()
    }
  }

  buildUrl (url) {
    let prefix = 'http://'
    if (url.substr(0, prefix.length) !== prefix) {
      url = prefix + url
    }
    return url
  }

  render () {
    let { institutions } = this.props.application
    let { id } = this.props.params
    let institution = institutions ? institutions.filter((d) => {
      return d.id === id
    })[0] : null

    return (
      <div>
        <div className="header">
          <h2>{institution ? institution.attributes.name : 'Institution'}</h2>
        </div>
        <div className="content">
          { institution &&
            <ul>
              <li>Type: <b>{institution.attributes.type}</b></li>
              <li>Capicity: <b>{institution.attributes['total-capacity']}</b></li>
              <li>Website: <a href={this.buildUrl(institution.attributes.website)}>{this.buildUrl(institution.attributes.website)}</a></li>
              <li>Provider Code: <b>{institution.attributes['provider-code']}</b></li>
              <li>Address: <b>{institution.attributes['postal-address']}</b></li>
            </ul>
          }
        </div>
      </div>
    )
  }
}
