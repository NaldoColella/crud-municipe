<template>
  <div class="MunicipeList">
    <MunicipeCard
      v-for="(municipe, index) in municipes"
      :municipe="municipe"
      :index="index"
      :key="municipe.id"
    />
    <BasePagination
      :current-page="currentPage"
      :page-count="pageCount"
      class="municipe-list__pagination"
      @nextPage="pageChangeHandle('next')"
      @previousPage="pageChangeHandle('previous')"
      @loadPage="pageChangeHandle"
    />
  </div>
</template>

<script>
export default {
  props: {
    municipes: {
      type: Array,
    },
    pageCount: {
      type: Number,
      default: 1,
    },
    searchText: {
      type: String,
      dafault: "",
    },
  },
  data: () => ({
    currentPage: 1,
  }),
  computed: {
    validSearchText() {
      return this.searchText !== "";
    },
  },
  methods: {
    pageChangeHandle(value) {
      switch (value) {
        case "next":
          this.currentPage += 1;
          break;
        case "previous":
          this.currentPage -= 1;
          break;
        default:
          this.currentPage = value;
      }
      this.$emit("pageChange", this.searchText, this.currentPage);
    },
  },
};
</script>
<style>
.MunicipeList {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}
</style>