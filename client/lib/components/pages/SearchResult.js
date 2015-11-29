import React, { PropTypes } from 'react'

export default class SearchResult extends React.Component {
  static propTypes = {
    application: PropTypes.object.isRequired
  }

  constructor (props) {
    super(props)
  }

  render () {
    let { institutions } = this.props.application
    return (
      <div className="content">
        <ul>
          { institutions &&
            institutions.map((institution) => {
              return (
                <li key={institution.id}>
                  <a href={institution.attributes.website}>
                    {institution.attributes.name}
                  </a>
                </li>
              )
            })
          }
        </ul>
      </div>
    )
  }
}
