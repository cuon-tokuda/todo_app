
<template>
  <div id="point">
  {{ text }}
    <h2>Tasks:</h2>
    <ul>
      <li v-for="task in tasks" :key="task.id">{{ task.name }}</li>
    </ul>
    <label for="category_ids">カテゴリ名</label>
    <select multiple="" id="category_ids">
      <option v-for="category in categories" :value="category.id" v-bind:key="category.id">
        {{ category.name }}
      </option>
    </select>
    <h2>Categories:</h2>
    <ul>
      <li v-for="category in categories" :key="category.id">{{ category.name }}</li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      text: 'Hello Vue',
      tasks: [],
      categories: []
    }
  },
  // mounted() {
  //   this.fetchData();
  // },
  // methods: {
  //   fetchData() {
  //     Promise.all([
  //       fetch('/tasks').then(response => response.json()),
  //       fetch('/categories').then(response => response.json())
  //     ]).then(([tasksData, categoriesData]) => {
  //       this.tasks = tasksData;
  //       this.categories = categoriesData;
  //     }).catch(error => {
  //       console.error('Error:', error);
  //     });
  //   }
  // }
}
</script>
