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

export {path_with_locale};