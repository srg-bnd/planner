import React from 'react'

class ScheduleLink extends React.Component {
  render() {
    const link = this.props.link

    return(
      <a className={`btn ml-1 btn-outline-${link.type}`} href={link.href}>
        {link.title}
      </a>
    )
  }
}

export default ScheduleLink