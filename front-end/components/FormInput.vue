<template>
  <b-form-group
    :id="'input-group-' + id"
    :label="label + ':'"
    :label-for="'input-' + id"
    :class="col"
  >
    <b-input-group>
      <b-input-group-prepend v-if="icon">
        <b-input-group-text>
          <b-icon :icon="icon" />
        </b-input-group-text>
      </b-input-group-prepend>

      <b-form-input
        :id="'input-' + id"
        v-validate="validate"
        v-mask="mask"
        :name="id"
        :value="value"
        :type="type"
        :placeholder="label"
        :aria-describedby="'input-' + id + '-feedback'"
        :data-vv-as="label"
        :state="validateState(id)"
        @input="onInputCallback"
        @blur="onBlurCallback"
      />

      <b-form-invalid-feedback :id="'input-' + id + '-feedback'">
        {{ veeErrors.first(id) }}
      </b-form-invalid-feedback>
    </b-input-group>
  </b-form-group>
</template>

<script>
export default {
  inject: ['$validator'],
  props: {
    validate: {
      type: Object,
      required: false,
      default: null
    },
    id: {
      type: String,
      required: true
    },
    type: {
      type: String,
      default: 'text',
      required: true
    },
    label: {
      type: String,
      default: null
    },
    value: {
      type: String,
      default: '',
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
    },
    mask: {
      type: String,
      default: '',
      required: false
    },
    callback: {
      type: Object,
      default: null
    }
  },
  methods: {
    validateState (ref) {
      if (
        this.veeFields[ref] &&
        (this.veeFields[ref].dirty || this.veeFields[ref].validated)
      ) {
        return !this.veeErrors.has(ref)
      }
      return null
    },
    onInputCallback ($event) {
      if (this.callback && this.callback.onInput) {
        this.callback.onInput($event, this)
      }
      this.$emit('input', $event)
    },
    onBlurCallback () {
      if (this.callback && this.callback.onBlur) {
        this.callback.onBlur(this)
      }
    }
  }
}
</script>
<style>
</style>
