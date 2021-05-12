const validator = {
  getMessage () {
    return 'Data de Nascimento Inválida'
  },

  validate (value) {
    return /^(?<dia>0[1-9]|[12][0-9]|3[01])\/(?<mes>0[1-9]|1[0-2])\/(?<ano>(?:19|20)\d{2})$/.test(value)
  }
}

export default validator
