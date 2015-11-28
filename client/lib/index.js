import '../assets/stylesheets/index.css'

import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import Root, { store } from './Root'

render(
  <Provider store={store}>
    <Root />
  </Provider>
, document.getElementById('app'))
