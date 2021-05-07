<template>
  <b-container>
    <b-row>
      <b-col cols="12">
        <b-table
          :items="getTable"
          :busy.sync="isBusy"
          :per-page="perPage"
          :current-page="currentPage"
          :fields="fields"
          :outlined="true"
          :fixed="true"
          :head-variant="'light'"
          :bordered="true"
          :hover="true"
          @row-dblclicked="rowDblClicked"
        >
          <template #cell(actions)="row">
            <b-button
              class="mr-1"
              size="sm"
              @click="info(row.item, row.index, $event.target)"
            >
              Modal
            </b-button>
          </template>
          <template #table-busy>
            <div class="text-center text-primary my-2">
              <b-spinner class="align-middle" />
              <strong>Carregando...</strong>
            </div>
          </template>
        </b-table>
      </b-col>
    </b-row>
    <b-row align-h="between">
      <b-col cols="2">
        <b-button variant="outline-primary" to="/cadastro">
          <b-icon icon="plus" style="margin-right: 5px" />Novo Cadastro
        </b-button>
      </b-col>
      <b-col cols="10" md="auto">
        <b-pagination
          v-model="currentPage"
          :total-rows="totalCount"
          :per-page="perPage"
          aria-controls="my-table"
        />
      </b-col>
    </b-row>
    <b-modal
      :id="infoModal.id"
      :title="infoModal.title"
      ok-only
      @hide="resetInfoModal"
    >
      <p>{{ infoModal.content }}</p>
    </b-modal>
  </b-container>
</template>

<script>
export default {
  data: () => ({
    municipes: [],
    totalCount: 0,
    searchText: '',
    isBusy: false,
    currentPage: 1,
    perPage: 5,
    infoModal: {
      id: 'info-modal',
      title: '',
      content: {}
    },
    fields: [
      { key: 'full_name', label: 'Nome Completo' },
      'cpf',
      { key: 'actions', label: 'Ações' }
    ]
  }),
  methods: {
    rowDblClicked (item, index, event) {
    },
    async getTable (ctx) {
      this.isBusy = true
      try {
        const params = {
          per_page: ctx.perPage,
          page: ctx.currentPage
        }

        const { items, totalCount } = await this.$axios.$get('/municipes', {
          params
        })
        this.isBusy = false
        this.totalCount = totalCount
        return items
      } catch (error) {
        this.isBusy = false
      }
    },
    info (item, index, button) {
      this.infoModal.title = ''
      this.infoModal.content = item
      this.$root.$emit('bv::show::modal', this.infoModal.id, button)
    },
    resetInfoModal () {
      this.infoModal.title = ''
      this.infoModal.content = ''
    }
  }
}
</script>

<style>
</style>
