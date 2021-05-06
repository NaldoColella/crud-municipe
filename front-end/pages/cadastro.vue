<template>
  <b-container>
    <b-form>
      <b-form-row>
        <b-form-group
          id="input-group-1"
          label="Nome Completo:"
          label-for="input-1"
          class="col-2"
        >
          <b-form-input
            id="input-1"
            v-model="form.full_name"
            type="text"
            placeholder="Nome Completo"
            required
          ></b-form-input>
        </b-form-group>

        <b-form-group
          id="input-group-2"
          label="CPF:"
          label-for="input-2"
          class="col-2"
        >
          <b-form-input
            id="input-2"
            v-model="form.cpf"
            type="text"
            placeholder="CPF"
            required
          ></b-form-input>
        </b-form-group>
      </b-form-row>
    </b-form>
  </b-container>
</template>

<script>
export default {
  data() {
    return {
      form: {
        full_name: "",
      },
    };
  },
};
</script>
