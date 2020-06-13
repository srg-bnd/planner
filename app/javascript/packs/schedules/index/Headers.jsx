import React from 'react'

class Headers extends React.Component {
  render() {
    return(
      <div className="card-header">
        {this.props.title}
      </div>
    )
  }
}

export default Headers
