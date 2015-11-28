import React, { PropTypes } from 'react'
import classnames from 'classnames'
import Footer from './Footer'
import DisplayError from './DisplayError'

export default class Application extends React.Component {

  static propTypes = {
    children: PropTypes.any
  }

  constructor (props, context) {
    super(props, context)
  }

  render () {
    return (
      <div id="layout">

        <div id="main">
          <DisplayError />
          {/* this will render the child routes */}
          {this.props.children}
        </div>

        <Footer />
      </div>
    )
  }
}
