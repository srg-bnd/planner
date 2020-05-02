import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes, { func } from 'prop-types'

class Schedule extends React.Component {
  render() {
    const data = this.props.data
    return(
      <div>
        <div className="card-body text-center">
          <h5 className="card-title">{data.title}</h5>
          <p className="card-text">{data.description}</p>
          <a className="btn btn-outline-primary" href={data.link.href}>
            {data.link.title}
          </a>
        </div>

        <div className="card-footer text-muted text-center">
          <svg className="bi bi-arrow-clockwise" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
            <path fillRule="evenodd" d="M3.17 6.706a5 5 0 017.103-3.16.5.5 0 10.454-.892A6 6 0 1013.455 5.5a.5.5 0 00-.91.417 5 5 0 11-9.375.789z" clipRule="evenodd"/>
            <path fillRule="evenodd" d="M8.147.146a.5.5 0 01.707 0l2.5 2.5a.5.5 0 010 .708l-2.5 2.5a.5.5 0 11-.707-.708L10.293 3 8.147.854a.5.5 0 010-.708z" clipRule="evenodd"/>
          </svg>
          {data.last_occupation_updated_at}
        </div>
      </div>
    )
  }
}

class Header extends React.Component {
  render() {
    const link = this.props.link
    const active = link.active ? 'active' : ''
    const disabled = link.disabled ? 'disabled' : ''

    return(
      <a
        className={`nav-link ${active} ${disabled}`}
        href={this.props.link.href}>
        {this.props.link.title}
      </a>
    )
  }
}

class Headers extends React.Component {
  render() {
    return(
      <div className="card-header">
        <ul className="nav nav-tabs card-header-tabs">
          { this.props.menu.map((link, i) => {
            return(
              <li className="nav-item" key={link.position}>
                <Header link={link} />
              </li>
            )
          })}
        </ul>
      </div>
    )
  }
}

class Schedules extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      error: null,
      isLoaded: false,
      fetch_data: {}
    }
  }

  componentDidMount() {
    fetch(path_with_locale("/api/v1/schedules"))
    .then((response) => response.json())
    .then((result) => {
      this.setState({
          data: result,
          isLoaded: true
      })
    })
    .catch(e => {
      console.log(e);
      this.setState({
        data: result,
        isLoaded: true,
        error: e 
      })
    })
  }  

  render() {
    const { data, isLoaded, error } = this.state
    if (!isLoaded) return(
      <div className="spinner-border text-primary" role="status">
        <span className="sr-only">Loading...</span>
      </div>
    )
    if (error) return <div>{`Catch error: ${error.message}`}</div>
    if (!data.success) return <div>>{'Server error: ${data.error}'}</div>

    const items = data.data

    return(
    <div className="card">
      <Headers menu={items.menu} />
      { items.schedules.map((schedule, i) => {
          return(
            <Schedule data={schedule} key={schedule.id} />
          )
      })}
    </div>
    )
  }
}

ReactDOM.render(
  <div className="container-fluid p-0 text-center">
    <Schedules/>
  </div>,
  document.querySelector('#index')
)


function path_with_locale(path) {
  var locale = null
  var params = getUrlParams()

  if(params.locale == null) {
    var pathname = window.location.pathname
    var ln = pathname.split('/')[1]
    if (['ru', 'en'].includes(ln)) locale = ln
  } else {
    locale = params.locale
  }

  if(locale == null) return path 
 
  return `/${locale}${path}`
}

/**
 * Returns a bare object of the URL's query parameters.
 * You can pass just a query string rather than a complete URL.
 * The default URL is the current page.
 */
function getUrlParams (url) {
  if (typeof url == 'undefined') {
      url = window.location.search
  }
  var url = url.split('#')[0] // Discard fragment identifier.
  var urlParams = {}
  var queryString = url.split('?')[1]
  if (!queryString) {
      if (url.search('=') !== false) {
          queryString = url
      }
  }
  if (queryString) {
      var keyValuePairs = queryString.split('&')
      for (var i = 0; i < keyValuePairs.length; i++) {
          var keyValuePair = keyValuePairs[i].split('=')
          var paramName = keyValuePair[0]
          var paramValue = keyValuePair[1] || ''
          urlParams[paramName] = decodeURIComponent(paramValue.replace(/\+/g, ' '))
      }
  }
  return urlParams
}
