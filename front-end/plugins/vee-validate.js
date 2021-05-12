import Vue from 'vue'
import Pt from 'vee-validate/dist/locale/pt_BR'
import VeeValidate, { Validator } from 'vee-validate'
import CpfValidator from '~/validators/cpfValidator'
import EmailValidator from '~/validators/emailValidator'
import DataValidator from '~/validators/dataValidator'

export default ({ app }) => {
  Vue.use(VeeValidate, {
    inject: false,
    fieldsBagName: 'veeFields',
    errorBagName: 'veeErrors'
  })

  Validator.localize('pt_BR', Pt)
  Validator.extend('cpf', CpfValidator)
  Validator.extend('email', EmailValidator)
  Validator.extend('data', DataValidator)
}
