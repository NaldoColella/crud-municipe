<template>
  <div>
    <header id="topo"></header>
    <Nuxt />
    <footer id="rodape">
      <b-container>
        <p>OM30 - Todos os direitos reservados</p>
      </b-container>
    </footer>
  </div>
</template>

<style>
header#topo {
  background: #007bff;
  width: 100%;
  height: 100px;
  margin-bottom: 50px;
}
footer#rodape{
  margin-top: 35px;
  background: #007bff;
  width: 100%;
  padding: 25px 0px;
}
footer#rodape p{
  margin-bottom: 0px;
  color: #fff;
}
html {
  font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, "Helvetica Neue", Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: border-box;
  margin: 0;
}

.table .thead-light th {
  color: #fff;
  background-color: #2c88ea;
  border-color: #dee2e6;
}
table.b-table .b-table-busy-slot td {
  padding: 60px 0px;
}
</style>
