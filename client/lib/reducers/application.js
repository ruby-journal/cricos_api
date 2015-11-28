import * as constants from '../constants'
import createReducer from '../utils/create-reducer'

const initialState = {
  indicator: null,
  institutions: null,
  error: null
}

const actionHandlers = {
  [constants.SHOW_ERROR]: (state, action) => {
    const { payload, source } = action
    return Object.assign({}, state, {
      // TODO: ideally we want to map API error response codes
      // with some user-friendly messages.
      error: {
        source,
        message: payload.message,
        statusCode: payload.statusCode || payload.code,
        body: payload.body || (payload instanceof Error ?
          (payload.toString() + '\n' + payload.stack) : payload)
      }
    })
  },
  [constants.HIDE_ERROR]: state => ({ ...state, ...{ error: null } }),
  [constants.FETCH_DATA]: (state, action) => ({ institutions: action.institutions })
}

export default createReducer(initialState, actionHandlers)
