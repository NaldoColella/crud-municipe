<template>
  <b-form-group
    :id="'select-group-' + id"
    :label="label + ':'"
    :label-for="'select-' + id"
    :class="col"
  >
    <b-input-group>
      <b-input-group-prepend v-if="icon">
        <b-input-group-text>
          <b-icon :icon="icon" />
        </b-input-group-text>
      </b-input-group-prepend>

      <b-form-select
        :id="'select-' + id"
        :name="'select-' + id"
        :value="value"
        :options="options"
        @change="$emit('input', $event)"
      />
    </b-input-group>
  </b-form-group>
</template>

<script>
export default {
  props: {
    options: {
      type: Array,
      required: true
    },
    id: {
      type: String,
      required: true
    },
    label: {
      type: String,
      default: null
    },
    value: {
      type: String,
      required: true
    },
    icon: {
      type: String,
      default: null,
      required: false
    },
    col: {
      type: String,
      default: 'col-4',
      required: true
    }
  }
}
</script>
<style>
</style>
