import Vue from 'vue'
import Pt from 'vee-validate/dist/locale/pt_BR'
import VeeValidate, { Validator } from 'vee-validate'
import CpfValidator from '~/validators/cpfValidator'

export default ({ app }) => {
  Vue.use(VeeValidate, {
    inject: true,
    fieldsBagName: 'veeFields',
    errorBagName: 'veeErrors'
  })

  Validator.localize('pt_BR', Pt)
  Validator.extend('cpf', CpfValidator)
}
