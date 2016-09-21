var gulp = require('gulp'),

    // plugins and such
    fs = require('fs'),
    path = require('path'),
    prefix = require('gulp-autoprefixer'),
    rename = require('gulp-rename'),
    stylus = require('gulp-stylus');

var demoFolderPath = './demo';

function getFolders(dir) {
  return fs.readdirSync(dir)
    .filter(function (file) {
      return fs.statSync(path.join(dir, file)).isDirectory();
    });
}

gulp.task('tiki-stylus', function () {
  var task = gulp.src('./styl/index.styl')
    .pipe(stylus())
    .pipe(prefix())
    .pipe(rename('tiki.css'))
    .pipe(gulp.dest('./dist'));

  return getFolders(demoFolderPath).reduce(function (task, folder) {
    task.pipe(gulp.dest(path.join(demoFolderPath, folder, '/www/')));
    return task
  }, task);
})

gulp.task('tiki-components', function () {
  return gulp.src('./src/**/*.styl')
    .pipe(stylus({
      paths : [__dirname, __dirname + "/styl"]
    }))
    .pipe(gulp.dest('./css'));
})

gulp.task('demo-stylus', function () {
  var task = gulp.src('./demo/demo.styl')
    .pipe(stylus())
    .pipe(prefix());

  return getFolders(demoFolderPath).reduce(function (task, folder) {
    task.pipe(gulp.dest(path.join(demoFolderPath, folder, '/www/')));
    return task;
  }, task);
});

gulp.task('html', function () {
  return getFolders(demoFolderPath).reduce(function (task, folder) {
    task.pipe(gulp.dest(path.join(demoFolderPath, folder, '/www/')));
    return task;
  }, gulp.src('./demo/index.html'));
})

gulp.task('build', ['tiki-stylus', 'tiki-components', 'demo-stylus', 'html']);

gulp.task('watch', ['build'], function () {
  gulp.watch(['./demo/*.html'], ['html']);
  gulp.watch(['./demo/*.styl'], ['demo-stylus']);
  gulp.watch(['./styl/**/*.styl'], ['tiki-stylus']);
  gulp.watch(['./src/**/*.styl'], ['tiki-components']);
});

gulp.task('default', ['watch']);
