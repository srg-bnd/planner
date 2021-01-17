import React from 'react'

class Headers extends React.Component {
  render() {
    return(
      <div className="card-header">
        {this.props.title}

        <a type="button" className="btn btn-default" href={this.props.links.create}>
          +
        </a>
      </div>
    )
  }
}

export default Headers
