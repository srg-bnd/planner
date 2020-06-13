import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes, { func } from 'prop-types'
import * as locale from '../../locale.js'

import Headers from './Headers'
import  Schedule from './Schedule'


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
    fetch(locale.path_with_locale("/api/v1/schedules"))
    .then((response) => response.json())
    .then((result) => {
      this.setState({
          data: result,
          isLoaded: true
      })
    })
    .catch(e => {
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
    if (!data.success) return <div>{'Server error: ${data.error}'}</div>

    const items = data.data

    return(
    <div className="card">
      <Headers title={items.title} />
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
