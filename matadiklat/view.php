<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header row">
                <div class="card-title h3 col-8">Data Mata Diklat</div>
                <div class="col-4">
                    <a href="?m=matadiklat&s=add" class="btn btn-lg btn-primary float-end">Tambah</a>
                </div>
            </div>

            <div class="card-body">
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Mata Diklat</th>
                            <th>Jam Diklat</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include_once('config.php');
                        $sql = "SELECT * FROM subjects";
                        $result = mysqli_query($con, $sql);
                        
                        if (mysqli_num_rows($result)) {
                            $no = 1;
                            while ($r = mysqli_fetch_assoc($result)) {
                                echo '<tr>
                                    <td>'.$no.'</td>
                                    <td>'.$r['subject'].'</td>
                                    <td>'.$r['hours'].'</td>
                                    <td>
                                        <a href="?m=matadiklat&s=edit&id='.$r['id'].'" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="?m=matadiklat&s=delete&id='.$r['id'].'" class="btn btn-danger btn-sm" onclick="return confirm(\'Yakin mata pelajaran akan dihapus?\')">Hapus</a>
                                    </td>
                                </tr>';
                                $no++;
                            }
                        } else {
                            echo '<tr>
                                <td colspan="5" align="center">Data Kosong</td>
                                </tr>';
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
