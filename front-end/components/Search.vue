<template>
  <form v-on:submit.prevent="searchMunicipes">
    <div class="inputSearchWrapper">
      <input v-model="searchText" id="name" placeholder="Digite um nome" />
      <button>Pesquisar</button>
    </div>
  </form>
</template>

<script>
export default {
  data: () => ({
    searchText: "",
  }),
  methods: {
    searchMunicipes() {
      this.$emit("search", this.searchText);
    },
  },
};
</script>

<style>
form {
  width: 100%;
  margin-top: 50px;
  margin-bottom: 35px;
  color: #9c9c9c;
}
form label {
  margin: 0 auto;
  display: block;
  text-align: center;
  margin-bottom: 35px;
}
form input {
  width: 360px;
  background: #fff;
  color: #a3a3a3;
  font: sans-serif;
  box-shadow: 0 6px 10px 0 rgb(0 0 0 / 10%);
  border: 0;
  outline: 0;
  padding: 22px 18px;
}
form button {
  display: inline-block;
  font: sans-serif;
  border: 0;
  outline: 0;
  transition: all 200ms ease-in;
  cursor: pointer;
  margin-left: -96px;
  background: #7f8ff4;
  color: #fff;
  box-shadow: 0 0 10px 2px rgb(0 0 0 / 10%);
  border-radius: 2px;
  padding: 12px 36px;
}
form button:hover {
  background: #6c7ff2;
}
form button:active {
  box-shadow: inset 0 0 10px 2px rgb(0 0 0 / 20%);
}
.inputSearchWrapper {
  justify-content: center;
  display: flex;
}
</style>