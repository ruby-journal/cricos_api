import 'whatwg-fetch'
import handleActionError from '../utils/handle-action-error'
import * as constants from '../constants'

// http://localhost:2300/api/v1/institutions
const API = 'http://localhost:2300/api/v1/'

export function fetchData (options = {}) {
  return dispatch => {
    fetch(`${API}/institutions`)
    .then(res => dispatch({
      type: FETCH_DATA,
      data: res
    }))
    .catch(error => handleActionError(dispatch, error, FETCH_DATA))
  }
}

export function hideError () {
  return { type: constants.HIDE_ERROR }
}

