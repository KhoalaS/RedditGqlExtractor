<script setup lang="ts">
import { WindowButton } from '../utils/Types';

defineProps<{
  title: string;
  buttons?: WindowButton[];
}>();
</script>
<template>
  <div class="window active">
    <div class="title-bar">
      <div class="title-bar-text">{{ title }}</div>
      <div class="title-bar-controls">
        <button
          @click="btn.onClick"
          v-for="btn in buttons"
          :aria-label="btn.label"
        ></button>
      </div>
    </div>
    <div class="window-body has-space">
      <slot name="content"> </slot>
    </div>
  </div>
</template>

