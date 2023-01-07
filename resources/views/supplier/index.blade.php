@extends('layout.app')

@section('title', 'Data Supplier')

@section('content')

<div class="card shadow">
    <div class="card-header">
        <h4 class="card-title">
            Data Supplier
        </h4>
    </div>
    <div class="card-body">
        <div class="d-flex justify-content-end mb-4">
            <a href="#modal-form" class="btn btn-primary modal-tambah">Tambah Data</a>
        </div>
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama supplier</th>
                        <th>Nama alamat</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>

    </div>

</div>

<div class="modal fade" id="modal-form" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Form Supplier</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-12">
                <form class="form-supplier">
                    <div class="form-group">
                        <label for="">Nama supplier</label>
                        <input type="text" class="form-control" name="nama_supplier"
                        placeholder="Nama supplier" required>
                    </div>

                    <div class="form-group">
                        <label for="">Alamat</label>
                        <textarea name="alamat" placeholder="alamat" class="form-control" id="" cols="30" rows="10" required></textarea>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </div>
                </form>

            </div>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

@endsection

@push('js')
<script>
    $(function(){

            $.ajax({
                url : '/api/suppliers',
                success : function ({data}) {

                    let row;
                    data.map(function(val, index) {
                        row += `
                        <tr>
                            <td>${index+1}</td>
                            <td>${val.nama_supplier}</td>
                            <td>${val.alamat}</td>
                            <td>
                                <a data-toggle="modal" href="modal-form" data-id="${val.id}" class="btn btn-warning modal-ubah">Edit</a>
                                <a href="#" data-id="${val.id}" class="btn btn-danger btn-hapus">Hapus</a>
                            </td>


                        </tr>`;
                    });

                    $('tbody').append(row);
                }
            })

            $(document).on('click', '.btn-hapus', function(){
                const id = $(this).data('id')
                const token = localStorage.getItem('token')

                confirm_dialog = confirm('apakah anda yakin?');



                if (confirm_dialog){
                    $.ajax({
                        url : '/api/suppliers/' + id,
                        type : "DELETE",
                        headers: {
                            'Authorization': 'Bearer ' + token
                          },
                        success : function(data){
                            if (data.message == 'success'){
                                alert('Data berhasil dihapus')
                                location.reload()
                            }

                        }
                    });
                }



            });

            $('.modal-tambah').click(function(){
                $('#modal-form').modal('show')
                $('input[name="nama_supplier"]').val('')
                $('textarea[name="alamat"]').val('')

                $('.form-supplier').submit(function(e){
                    e.preventDefault()

                    const token = localStorage.getItem('token')
                    const formData = new FormData(this);

                    $.ajax({
                        url : 'api/suppliers',
                        type : 'POST',
                        data : formData,
                        contentType: false,
                        processData: false,
                        headers: {
                            'Authorization': 'Bearer ' + token
                          },
                        success : function(data){
                            if (data.success){
                                alert('Data berhasil ditambah')
                                location.reload();
                            }

                        }
                    })
                });
            });

            $(document).on('click', '.modal-ubah', function(){
                $('#modal-form').modal('show')
                const id =$(this).data('id');

                $.get('/api/suppliers/' + id,function({
                    data
                }) {
                    $('input[name="nama_supplier"]').val(data.nama_supplier);
                    $('textarea[name="alamat"]').val(data.alamat);
                });

                $('.form-supplier').submit(function(e){
                    e.preventDefault()

                    const token = localStorage.getItem('token')
                    const formData = new FormData(this);

                    console.log(id)

                    $.ajax({
                        url : `api/suppliers/${id}?_method=PUT`,
                        type : 'POST',
                        data : formData,
                        contentType: false,
                        processData: false,
                        headers: {
                            'Authorization': 'Bearer ' + token
                          },
                        success : function(data){
                            if (data.success){
                                alert('Data berhasil diubah')
                                location.reload();
                            }

                        }
                    })
                });

            });

        });
</script>

@endpush
