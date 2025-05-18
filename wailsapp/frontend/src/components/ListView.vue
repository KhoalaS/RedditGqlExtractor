<script setup lang="ts" generic="T">
import { ref, watch } from 'vue';

const props = defineProps<{
  data: T[];
  header: string[];
  hasShadow?: boolean;
}>();

watch(
  () => props.data,
  () => {
    activeRow.value = undefined;
  }
);

const activeRow = ref<number | undefined>();

const model = defineModel<T>();

function updateModel(value: T, idx: number) {
  model.value = value;
  activeRow.value = idx;
}
</script>
<template>
  <table :class="{ 'has-shadow': hasShadow }">
    <thead>
      <tr>
        <th v-for="label in header">
          {{ label }}
        </th>
      </tr>
    </thead>
    <tbody @keydown.capture="(e) => console.log(e)">
      <tr
        :class="{ highlighted: activeRow == idx }"
        @click="updateModel(field, idx)"
        v-for="(field, idx) in data"
        :key="idx"
      >
        <td v-for="val in field">
          {{ val }}
        </td>
      </tr>
    </tbody>
  </table>
</template>

