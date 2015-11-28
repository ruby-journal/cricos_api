import React, { PropTypes } from 'react'
// import shallowEqual from 'react-redux/lib/utils/shallowEqual'
import { findDOMNode } from 'react-dom'

export default class SearchBox extends React.Component {
  static propTypes = {
    history: PropTypes.object.isRequired,
    actions: PropTypes.object.isRequired
  }

  constructor (props) {
    super(props)

    this.handleKeyUp = this.handleKeyUp.bind(this)
    this.handleOnChange = this.handleOnChange.bind(this)
    this.handleGoClick = this.handleGoClick.bind(this)
    this.getInputValue = this.getInputValue.bind(this)

    this.state = {
      indicator: ''
    }
  }

  render () {
    return (
      <div className="content">
        <form className="explore pure-form" onSubmit={e => e.preventDefault()}>
          <fieldset>
            <input
              size="45"
              ref="indicator"
              onKeyUp={this.handleKeyUp}
              onChange={this.handleOnChange}
              value={this.state.indicator}
              placeholder="institutions" />
            <button type="submit" className="pure-button pure-button-primary"
              onClick={this.handleGoClick}>
              Search
            </button>
          </fieldset>
        </form>
      </div>
    )
  }

  handleKeyUp (e) {
    if (e.keyCode === 13)
      this.handleGoClick()
  }

  handleOnChange () {
    this.setState({
      indicator: this.getInputValue()
    })
  }

  handleGoClick () {
    console.log('indicator', this.state.indicator)
    this.props.actions.fetchData()
    // this.context.history.pushState({}, `/stargazers/${this.getInputValue()}`)
  }

  getInputValue () {
    return findDOMNode(this.refs.indicator).value
  }
}
