<template>
  <b-container fluid>
    <b-table
      :items="getTable"
      :busy.sync="isBusy"
      :per-page="perPage"
      :current-page="currentPage"
      :fields="fields"
    >
      <template #cell(actions)="row">
        <b-button
          size="sm"
          @click="info(row.item, row.index, $event.target)"
          class="mr-1"
        >
          Modal
        </b-button>
      </template>
    </b-table>
    <b-row>
      <b-col>
        <b-pagination
          v-model="currentPage"
          :total-rows="totalCount"
          :per-page="perPage"
          aria-controls="my-table"
        ></b-pagination>
      </b-col>
    </b-row>
    <b-modal
      :id="infoModal.id"
      :title="infoModal.title"
      ok-only
      @hide="resetInfoModal"
    >
    <p>{{infoModal.content}}</p>
    </b-modal>
  </b-container>
</template>

<script>
export default {
  data: () => ({
    municipes: [],
    totalCount: 0,
    searchText: "",
    isBusy: false,
    currentPage: 1,
    perPage: 5,
    infoModal: {
      id: "info-modal",
      title: "",
      content: {},
    },
    fields: [{ key: "full_name", label: "Nome Completo" }, "cpf", { key: 'actions', label: 'Actions' }],
  }),
  methods: {
    async getTable(ctx) {
      this.isBusy = true;
      try {
        const params = {
          per_page: ctx.perPage,
          page: ctx.currentPage
        };

        const { items, totalCount } = await this.$axios.$get('/municipes', { params });
        this.isBusy = false;
        this.totalCount = totalCount;
        return items;
      } catch (error) {
        this.isBusy = false;
      }
    },
    info(item, index, button) {
      this.infoModal.title = "";
      this.infoModal.content = item;
      this.$root.$emit("bv::show::modal", this.infoModal.id, button);
    },
    resetInfoModal() {
      this.infoModal.title = "";
      this.infoModal.content = "";
    },
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
