<template>
  <div class="MunicipeCard">
    <p>{{municipe}}</p>
  </div>
</template>

<script>
export default {
  props: {
    municipe: {
      type: Object,
      required: true,
    },
  },
};
</script>
<style>
.MunicipeCard {
  width: 100%;
  box-sizing: border-box;
  text-align: center;
  position: relative;
}
.MunicipeCard:hover::after {
  opacity: 0.6;
  z-index: 7;
}
.MunicipeCard:after {
  background: rgb(125 125 125);
  opacity: 0;
  content: "";
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0px;
  transition: 0.3s;
  top: 0px;
}
.MunicipeCard img {
  width: 100%;
}
</style>