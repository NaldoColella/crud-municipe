<template>
  <b-form @submit="save">
    <b-form-row>
      <b-col lg="12">
        <h2 class="title-custom-blue">
          Cadastro de Munícipe
        </h2>
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
                <FormInput
                  :id="'nome-completo'"
                  v-model="form.nome_completo"
                  :validate="{ required: true, min: 3 }"
                  :type="'text'"
                  :icon="'person'"
                  :col="'col-4'"
                  :label="'Nome Completo'"
                />

                <FormInput
                  :id="'cpf'"
                  v-model="form.cpf"
                  :label="'CPF'"
                  :col="'col-3'"
                  :type="'text'"
                  :validate="{ required: true, max: 14, cpf: true }"
                  :mask="masks.cpf"
                />

                <FormInput
                  :id="'telefone'"
                  v-model="form.telefone"
                  :label="'Telefone'"
                  :col="'col-3'"
                  :type="'text'"
                  :validate="{ required: true, min: 14 }"
                  :mask="masks.telefone"
                  :callback="callback.telefone"
                  @updatePhoneMask="onUpdatePhoneMask"
                />

                <FormSelect
                  :id="'status'"
                  v-model="form.status"
                  :label="'Status'"
                  :col="'col-2'"
                  :options="optionsStatus"
                  :disabled="true"
                />
              </b-form-row>

              <b-form-row>
                <FormInput
                  :id="'e-mail'"
                  v-model="form.email"
                  :type="'text'"
                  :icon="''"
                  :col="'col-3'"
                  :label="'E-mail'"
                  :validate="{ required: true, email: true }"
                />

                <FormInput
                  :id="'data-nascimento'"
                  v-model="form.data_nascimento"
                  :type="'text'"
                  :icon="''"
                  :col="'col-4'"
                  :label="'Data de Nascimento'"
                  :mask='masks.date'
                  :placeholder="'dd/mm/aaaa'"
                  :validate="{ required: true, data: true }"
                />

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
                    />

                    <b-input-group-apend
                      v-if="form.foto"
                      style="margin-left: 10px"
                    >
                      <b-button
                        v-if="form.foto"
                        block
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
        <h4 class="title-custom-blue">
          Endereço
        </h4>
      </b-col>
    </b-form-row>

    <b-form-row>
      <FormInput
        :id="'cep'"
        v-model="form.address_attributes.cep"
        :type="'text'"
        :col="'col-2'"
        :label="'CEP'"
        :mask="masks.cep"
        :callback="callback.cep"
        @updateCEP="onUpdateCEP"
      />

      <FormInput
        :id="'logradouro'"
        v-model="form.address_attributes.logradouro"
        :type="'text'"
        :col="'col-6'"
        :label="'Logradouro'"
      />

      <FormInput
        :id="'complemento'"
        v-model="form.address_attributes.complemento"
        :type="'text'"
        :col="'col-4'"
        :label="'Complemento'"
      />

      <FormInput
        :id="'bairro'"
        v-model="form.address_attributes.bairro"
        :type="'text'"
        :col="'col-3'"
        :label="'Bairro'"
      />

      <FormInput
        :id="'cidade'"
        v-model="form.address_attributes.cidade"
        :type="'text'"
        :col="'col-4'"
        :label="'Cidade'"
      />

      <FormInput
        :id="'uf'"
        v-model="form.address_attributes.uf"
        :type="'text'"
        :col="'col-2'"
        :label="'UF'"
      />

      <FormInput
        :id="'ibge'"
        v-model="form.address_attributes.ibge"
        :type="'text'"
        :col="'col-3'"
        :label="'IBGE'"
      />
    </b-form-row>

    <hr />

    <b-button variant="primary" type="submit">
      <b-icon icon="file-earmark" style="margin-right: 5px" />Salvar
    </b-button>

    <b-button variant="outline-primary" to="/">
      <b-icon icon="arrow-left" style="margin-right: 5px" />Listagem
    </b-button>
  </b-form>
</template>

<script>
export default {
  $_veeValidate: {
    validator: 'new' // give me my own validator scope.
  },
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
      callback: {
        cep: {
          onBlur: (that) => {
            that.$emit('updateCEP')
          }
        },
        telefone: {
          onInput: (value, that) => {
            if (value.length > 14) {
              that.$emit('updatePhoneMask', '(99) 99999-9999')
            } else {
              that.$emit('updatePhoneMask', '(99) 9999-99999')
            }
          }
        }
      },
      imgUrlPreview: '',
      masks: {
        cpf: '999.999.999-99',
        telefone: '(99) 9999-9999',
        cep: '99.999.999',
        date: '99/99/9999'
      },
      optionsStatus: [
        { value: 'true', text: 'Ativo' },
        { value: 'false', text: 'Inativo' }
      ]
    }
  },
  computed: {
    formImg () {
      return this.form.foto
    }
  },
  watch: {
    formImg () {
      this.imgUrlPreview = this.form.foto
        ? URL.createObjectURL(this.form.foto)
        : ''
    }
  },
  methods: {
    onUpdatePhoneMask (value) {
      this.masks.telefone = value
    },
    onUpdateCEP () {
      this._getAddresViaCEP()
    },
    async _getAddresViaCEP () {
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
