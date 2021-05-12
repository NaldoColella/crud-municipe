const validator = {
  getMessage () {
    return 'E-mail Inválido'
  },

  validate (value) {
    return /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test(value)
  }
}

export default validator
