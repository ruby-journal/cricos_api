/* global __DEVTOOLS__ */
import '../assets/stylesheets/index.css'

import React, { PropTypes } from 'react'
import { Redirect, Route } from 'react-router'
import { ReduxRouter } from 'redux-router'
import { connect } from 'react-redux'
import configureStore from './utils/configure-store'
import * as components from './components'
import * as constants from './constants'

const {
  About,
  Application,
  Home
} = components

export const store = configureStore()

function getRootChildren (props) {
  const rootChildren = [
    <div key='Root'>
      {renderRoutes()}
    </div>
  ]

  if (__DEVTOOLS__) {
    const DevTools = require('./components/DevTools')
    rootChildren.push(<DevTools key="devtools" />)
  }

  return rootChildren
}

function renderRoutes () {
  return (
    <ReduxRouter>
      <Route component={Application}>
        <Route path="/" component={Home} />
        <Route path="about" component={About} />
      </Route>
    </ReduxRouter>
  )
}

@connect(({ application }) => ({ application }))
export default class Root extends React.Component {
  static propTypes = {
    application: PropTypes.object.isRequired
  }

  render () {
    return (
      <div>{getRootChildren(this.props)}</div>
    )
  }
}
