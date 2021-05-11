<template>
  <b-container>
    <b-form @submit="save">
      <b-form-row>
        <b-col lg="12">
          <h2 class="title-custom-blue">Cadastro de Munícipe</h2>
        </b-col>
      </b-form-row>

      <b-form-row>
        <b-col lg="12" style="display: flex" class="form-group">
          <div style="flex: 0 0 160px">
            <div id="preview">
              <img v-if="imgUrlPreview" :src="imgUrlPreview" />
              <div v-if="!imgUrlPreview" class="placeholder">
                <b-icon icon="image" />
              </div>
            </div>
          </div>
          <div style="flex: 1">
            <b-form-row>
              <b-col lg="12">
                <b-form-row>
                  <b-form-group
                    id="input-group-nome-completo"
                    label="Nome Completo:"
                    label-for="input-nome-completo"
                    class="col-4"
                  >
                    <b-input-group>
                      <b-input-group-prepend>
                        <b-input-group-text>
                          <b-icon icon="person" />
                        </b-input-group-text>
                      </b-input-group-prepend>

                      <b-form-input
                        id="input-nome-completo"
                        name="input-nome-completo"
                        v-model="form.nome_completo"
                        type="text"
                        placeholder="Nome Completo"
                        v-validate="{ required: true, min: 3 }"
                        :state="validateState('input-nome-completo')"
                        aria-describedby="input-nome-completo-feedback"
                        data-vv-as="Nome Completo"
                      ></b-form-input>

                      <b-form-invalid-feedback
                        id="input-nome-completo-feedback"
                        >{{
                          veeErrors.first("input-nome-completo")
                        }}</b-form-invalid-feedback
                      >
                    </b-input-group>
                  </b-form-group>

                  <b-form-group
                    id="input-group-cpf"
                    label="CPF:"
                    label-for="input-cpf"
                    class="col-3"
                  >
                    <b-form-input
                      id="input-cpf"
                      name="input-cpf"
                      v-model="form.cpf"
                      type="text"
                      placeholder="CPF"
                      v-mask="masks.cpf"
                      v-validate="{required: true, max: 14, cpf: true}"
                      :state="validateState('input-cpf')"
                      aria-describedby="input-cpf-feedback"
                      data-vv-as="CPF"
                    ></b-form-input>
                    <b-form-invalid-feedback
                        id="input-cpf-feedback"
                        >{{
                          veeErrors.first("input-cpf")
                        }}</b-form-invalid-feedback
                      >
                  </b-form-group>

                  <b-form-group
                    id="input-group-3"
                    label="Telefone:"
                    label-for="input-3"
                    class="col-3"
                  >
                    <b-form-input
                      id="input-3"
                      v-model="form.telefone"
                      type="text"
                      placeholder="Telefone"
                      v-mask="masks.telefone"
                      @input="_updateMask"
                    ></b-form-input>
                  </b-form-group>

                  <b-form-group
                    id="input-group-4"
                    label="Status:"
                    label-for="input-4"
                    class="col-2"
                  >
                    <b-form-select
                      id="input-4"
                      v-model="form.status"
                      :options="optionsStatus"
                      disabled
                    ></b-form-select>
                  </b-form-group>
                </b-form-row>
                <b-form-row>
                  <b-form-group
                    id="input-group-5"
                    label="E-mail:"
                    label-for="input-5"
                    class="col-3"
                  >
                    <b-form-input
                      id="input-5"
                      v-model="form.email"
                      type="email"
                      placeholder="E-mail"
                    ></b-form-input>
                  </b-form-group>

                  <b-form-group
                    id="input-group-6"
                    label="Data de Nascimento:"
                    label-for="input-6"
                    class="col-4"
                  >
                    <b-form-datepicker
                      id="input-6"
                      v-model="form.data_nascimento"
                      v-bind="labels['pt-BR']"
                      :locale="'pt-BR'"
                    ></b-form-datepicker>
                  </b-form-group>
                  <b-form-group
                    id="input-group-3"
                    label="Foto:"
                    label-for="input-3"
                    class="col-5"
                  >
                    <b-input-group>
                      <b-form-file
                        v-model="form.foto"
                        :state="Boolean(form.foto)"
                        placeholder="Escolha uma foto"
                        drop-placeholder="Arraste a foto aqui..."
                        accept="image/*"
                        browse-text="Pesquisar"
                      ></b-form-file>
                      <b-input-group-apend
                        v-if="form.foto"
                        style="margin-left: 10px"
                      >
                        <b-button
                          block
                          v-if="form.foto"
                          variant="outline-primary"
                          @click="form.foto = null"
                        >
                          <span>Remover</span>
                        </b-button>
                      </b-input-group-apend>
                    </b-input-group>
                  </b-form-group>
                </b-form-row>
              </b-col>
            </b-form-row>
          </div>
        </b-col>
      </b-form-row>

      <b-form-row>
        <b-col lg="12">
          <h4 class="title-custom-blue">Endereço</h4>
        </b-col>
      </b-form-row>

      <b-form-row>
        <b-form-group
          id="input-group-cep"
          label="CEP:"
          label-for="input-cep"
          class="col-2"
        >
          <b-form-input
            id="input-cep"
            v-model="form.address_attributes.cep"
            type="text"
            placeholder="Cep"
            @blur="getAddresViaCEP"
            v-mask="masks.cep"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-logradouro"
          label="Logradouro:"
          label-for="input-logradouro"
          class="col-6"
        >
          <b-form-input
            id="input-logradouro"
            v-model="form.address_attributes.logradouro"
            type="text"
            placeholder="Logradouro"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-complemento"
          label="Complemento:"
          label-for="input-complemento"
          class="col-4"
        >
          <b-form-input
            id="input-complemento"
            v-model="form.address_attributes.complemento"
            type="text"
            placeholder="Complemento"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-bairro"
          label="Bairro:"
          label-for="input-bairro"
          class="col-3"
        >
          <b-form-input
            id="input-bairro"
            v-model="form.address_attributes.bairro"
            type="text"
            placeholder="Bairro"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-cidade"
          label="Cidade:"
          label-for="input-cidade"
          class="col-4"
        >
          <b-form-input
            id="input-cidade"
            v-model="form.address_attributes.cidade"
            type="text"
            placeholder="Cidade"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-uf"
          label="UF:"
          label-for="input-uf"
          class="col-2"
        >
          <b-form-input
            id="input-uf"
            v-model="form.address_attributes.uf"
            type="text"
            placeholder="UF"
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-ibge"
          label="IBGE:"
          label-for="input-ibge"
          class="col-3"
        >
          <b-form-input
            id="input-ibge"
            v-model="form.address_attributes.ibge"
            type="text"
            placeholder="IBGE"
          ></b-form-input>
        </b-form-group>
      </b-form-row>
      <hr />
      <b-button variant="primary" type="submit">
        <b-icon icon="file-earmark" style="margin-right: 5px" />Salvar
      </b-button>

      <b-button variant="outline-primary" to="/">
        <b-icon icon="arrow-left" style="margin-right: 5px" />Listagem
      </b-button>
    </b-form>
  </b-container>
</template>

<script>
export default {
  data () {
    return {
      form: {
        nome_completo: '',
        cpf: '',
        telefone: '',
        foto: null,
        status: 'true',
        data_nascimento: '',
        address_attributes: {
          cep: '',
          logradouro: '',
          bairro: '',
          cidade: '',
          uf: '',
          ibge: '',
          complemento: ''
        }
      },
      optionsStatus: [
        { value: 'true', text: 'Ativo' },
        { value: 'false', text: 'Inativo' }
      ],
      labels: {
        'pt-BR': {
          labelPrevYear: 'Ano anterior',
          labelPrevMonth: 'Mês anterior',
          labelCurrentMonth: 'Mês Atual',
          labelNextMonth: 'Próximo Mês',
          labelNextYear: 'Próximo Ano',
          labelToday: 'Hoje',
          labelSelected: 'Data Selecionada',
          labelNoDateSelected: 'Sem Data Selecionada',
          labelCalendar: 'Calendário',
          labelNav: 'Navegação do Calendário',
          labelHelp: 'Use as setas do teclado para navegar'
        }
      },
      masks: {
        cpf: '999.999.999-99',
        telefone: '(99) 9999-9999',
        cep: '99.999.999'
      },
      imgUrlPreview: ''
    }
  },
  computed: {
    formImg () {
      return this.form.foto
    }
  },
  beforeMount () {

  },
  watch: {
    formImg () {
      this.imgUrlPreview = this.form.foto
        ? URL.createObjectURL(this.form.foto)
        : ''
    }
  },
  methods: {
    validateState (ref) {
      if (
        this.veeFields[ref] &&
        (this.veeFields[ref].dirty || this.veeFields[ref].validated)
      ) {
        return !this.veeErrors.has(ref)
      }
      return null
    },
    _updateMask (ev) {
      if (ev.length > 14) {
        this.masks.telefone = '(99) 99999-9999'
      } else {
        this.masks.telefone = '(99) 9999-99999'
      }
    },
    sanitizeMasks (form) {
      const fields = Object.keys(form)
      const sanitizedForm = {}

      for (let i = 0; i < fields.length; i++) {
        const field = fields[i]
        if (field === 'address_attributes') {
          sanitizedForm[field] = this.sanitizeMasks(form[field])
          continue
        }
        switch (field) {
          case 'cpf':
          case 'telefone':
            sanitizedForm[field] = form[field].replace(/[^0-9]/g, '')
            break
          default:
            sanitizedForm[field] = form[field]
            break
        }
      }
      console.log(sanitizedForm)
      return sanitizedForm
    },
    save (e) {
      e.preventDefault()
      this.$validator.validateAll().then((result) => {
        if (!result) {
          return
        }
        const payload = this.sanitizeMasks(this.form)

        this.$axios.post('/municipes', payload)
          .then((res) => {
            alert('Registro inserido com sucesso')
            console.log(res)
          })
          .catch((err) => {
            alert('erro na requisicao de post')
            console.log(err)
          })
      })
    },
    async getAddresViaCEP () {
      try {
        const cep = this.form.address_attributes.cep.replace(/[^0-9]/g, '')
        if (cep === '' || /^[0-9]{8}$/.test(cep) !== true) { return }
        const { logradouro, complemento, bairro, uf, localidade, ibge, erro } = await this.$axios.$get('https://viacep.com.br/ws/' + cep + '/json/')
        if (erro) { alert('erro: Cep não existente na base, favor digitar manualmente') }
        this.form.address_attributes = {
          cep: this.form.address_attributes.cep,
          logradouro,
          bairro,
          cidade: localidade,
          uf,
          ibge,
          complemento
        }
      } catch (error) {
      }
    }
  }
}
</script>
<style>
#preview {
  width: 150px;
  height: 150px;
}
#preview img {
  max-width: 150px;
  max-height: 150px;
}
.placeholder {
  position: relative;
  width: 100%;
  height: 100%;
  background: #f2f2f2;
}
.placeholder .b-icon {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 45px;
}
.form-group > label {
  margin-bottom: 5px;
}
.title-custom-blue {
  border-bottom: 1px solid #69b1ff;
  padding-bottom: 5px;
  margin-bottom: 20px;
}
</style>
