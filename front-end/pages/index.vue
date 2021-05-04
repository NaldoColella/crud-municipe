<template>
  <div>
    <Search @search="getMunicipes" />
    <MunicipeList
      :municipes="municipes"
      :pageCount="pageCount"
      :searchText="searchText"
      @pageChange="getMunicipes"
    />
  </div>
</template>

<script>
export default {
  data: () => ({
    municipes: [],
    pageCount: 1,
    searchText: "",
  }),
  methods: {
    async getMunicipes(name, page = 1) {
      const res = await this.$axios.$get('http://127.0.0.1:3000/municipes/')
      this.municipes = res
    }
  },
};
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: "Quicksand", "Source Sans Pro", -apple-system, BlinkMacSystemFont,
    "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
