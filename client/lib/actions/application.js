import 'whatwg-fetch'
import handleActionError from '../utils/handle-action-error'
import processResponse from '../utils/process-response'
import {
  FETCH_DATA,
  HIDE_ERROR
} from '../constants'

// http://localhost:2300/api/v1/institutions
const API = 'http://localhost:2300/api/v1'

export function fetchData () {
  return dispatch => {
    fetch(`${API}/institutions`)
    .then(processResponse)
    .then(res => dispatch({
      type: FETCH_DATA,
      institutions: res.data
    }))
    .catch(error => handleActionError(dispatch, error, FETCH_DATA))
  }
}

export function hideError () {
  return { type: HIDE_ERROR }
}

