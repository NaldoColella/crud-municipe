function checkDigits (cpf) {
  let sum = 0
  const size = cpf.length

  if (size !== 9 && size !== 10) {
    return false
  }

  for (let i = 0; i < size; ++i) {
    sum += cpf.toString().charAt(i) * (size + 1 - i)
  }

  const lastSumChecker = sum % 11
  const checker = (lastSumChecker < 2) ? 0 : 11 - lastSumChecker

  return checker
}

function cleaner (value) {
  const digits = value.replace(/[^\d]/g, '')
  return digits
}

function validate (value) {
  const cleanCPF = cleaner(value)
  const firstNineDigits = cleanCPF.substring(0, 9)
  const checker = cleanCPF.substring(9, 11)
  const regex = /^(?:(\d)\1{10})$|(\D)|^(\d{12,})$|^(\d{0,10})$/g

  if (cleanCPF.match(regex)) {
    return false
  }

  const checker1 = checkDigits(firstNineDigits)
  const checker2 = checkDigits(`${firstNineDigits}${checker1}`)

  if (checker.toString() === checker1.toString() + checker2.toString()) {
    return true
  }

  return false
}

export default validate
