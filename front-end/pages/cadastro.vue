<template>
  <b-container>
    <b-form>
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
                    id="input-group-1"
                    label="Nome Completo:"
                    label-for="input-1"
                    class="col-4"
                  >
                    <b-input-group>
                      <b-input-group-prepend>
                        <b-input-group-text>
                          <b-icon icon="person" />
                        </b-input-group-text>
                      </b-input-group-prepend>

                      <b-form-input
                        id="input-1"
                        v-model="form.full_name"
                        type="text"
                        placeholder="Nome Completo"
                        required
                      ></b-form-input>
                    </b-input-group>
                  </b-form-group>

                  <b-form-group
                    id="input-group-2"
                    label="CPF:"
                    label-for="input-2"
                    class="col-3"
                  >
                    <b-form-input
                      id="input-2"
                      v-model="form.cpf"
                      type="text"
                      placeholder="CPF"
                      required
                    ></b-form-input>
                  </b-form-group>

                  <b-form-group
                    id="input-group-3"
                    label="Telefone:"
                    label-for="input-3"
                    class="col-3"
                  >
                    <b-form-input
                      id="input-3"
                      v-model="form.phone"
                      type="text"
                      placeholder="Telefone"
                      required
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
                      v-model="form.mail"
                      type="email"
                      placeholder="E-mail"
                      required
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
                      v-model="form.dta_nasc"
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
                        v-model="form.img"
                        :state="Boolean(form.img)"
                        placeholder="Escolha uma foto"
                        drop-placeholder="Arraste a foto aqui..."
                        accept="image/*"
                        browse-text="Pesquisar"
                        required
                      ></b-form-file>
                      <b-input-group-apend
                        v-if="form.img"
                        style="margin-left: 10px"
                      >
                        <b-button
                          block
                          v-if="form.img"
                          variant="outline-primary"
                          @click="form.img = null"
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
            required
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
            required
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
            required
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
            required
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
            required
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
            required
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
    </b-form>

    <b-button variant="primary" @click="save">
      <b-icon icon="file-earmark" style="margin-right: 5px"></b-icon
      ><span>Salvar</span>
    </b-button>

    <b-button variant="outline-primary" to="/">
      <b-icon icon="arrow-left" style="margin-right: 5px"></b-icon
      ><span>Listagem</span>
    </b-button>
  </b-container>
</template>

<script>
export default {
  data () {
    return {
      form: {
        full_name: '',
        cpf: '',
        phone: '',
        img: null,
        status: true,
        dta_nasc: '',
        address_attributes: {
          cep: '',
          logradouro: '',
          bairro: '',
          cidade: '',
          uf: ''
        }
      },
      optionsStatus: [
        { value: true, text: 'Ativo' },
        { value: false, text: 'Inativo' }
      ],
      imgUrlPreview: ''
    }
  },
  watch: {
    formImg () {
      this.imgUrlPreview = this.form.img
        ? URL.createObjectURL(this.form.img)
        : ''
    }
  },
  computed: {
    formImg () {
      return this.form.img
    }
  },
  methods: {
    save () {
      console.log(this.form)
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
